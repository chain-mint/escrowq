;; =========================================================================
;; Contract: BitProof Escrow
;; Description: A trusted escrow contract for Freelancer/Buyer agreements.
;; =========================================================================

;; -------------------------------------------------------------------------
;; Constants & Error Codes
;; -------------------------------------------------------------------------

;; Status Enums
(define-constant STATUS-PENDING u0)   ;; Agreement created, funds locked
(define-constant STATUS-WORK-DONE u1) ;; Freelancer marked work as finished
(define-constant STATUS-COMPLETED u2) ;; Funds released to freelancer
(define-constant STATUS-DISPUTED u3)  ;; Dispute flagged
(define-constant STATUS-REFUNDED u4)  ;; Funds returned to buyer

;; Error Codes
(define-constant ERR-NOT-AUTHORIZED (err u100))
(define-constant ERR-ALREADY-INITIALIZED (err u101))
(define-constant ERR-NOT-INITIALIZED (err u102))
(define-constant ERR-WRONG-STATUS (err u103))
(define-constant ERR-DEADLINE-NOT-PASSED (err u104))
(define-constant ERR-INVALID-BENEFICIARY (err u105))

;; -------------------------------------------------------------------------
;; Data Variables
;; -------------------------------------------------------------------------

(define-data-var buyer principal tx-sender)
(define-data-var freelancer principal tx-sender)
(define-data-var arbitrator principal tx-sender)
(define-data-var escrow-amount uint u0)
(define-data-var milestone-deadline uint u0)
(define-data-var current-status uint STATUS-PENDING)
(define-data-var is-initialized bool false)

;; -------------------------------------------------------------------------
;; Read-Only Functions
;; -------------------------------------------------------------------------


(define-read-only (get-info)
    (ok {
        buyer: (var-get buyer),
        freelancer: (var-get freelancer),
        arbitrator: (var-get arbitrator),
        amount: (var-get escrow-amount),
        deadline: (var-get milestone-deadline),
        status: (var-get current-status),
        balance: (var-get escrow-amount)
    })
)

(define-read-only (get-status)
    (ok (var-get current-status))
)


;; -------------------------------------------------------------------------
;; Core Functions
;; -------------------------------------------------------------------------

;; 1. Initialize Escrow
;; Caller (Buyer) deposits funds and configures the contract.
;; Can only be called once.

;; 1. Initialize Escrow

(define-public (initialize-escrow
  (freelancer-addr principal)
  (arbitrator-addr principal)
  (amount uint)
  (deadline uint)
)
  (begin
    (asserts! (not (var-get is-initialized)) ERR-ALREADY-INITIALIZED)

    ;; transfer STX from caller to this contract
    (try! (stx-transfer? amount tx-sender current-contract))

    (var-set buyer tx-sender)
    (var-set freelancer freelancer-addr)
    (var-set arbitrator arbitrator-addr)
    (var-set escrow-amount amount)
    (var-set milestone-deadline deadline)
    (var-set current-status STATUS-PENDING)
    (var-set is-initialized true)
    (ok true)
  )
)

;; 2. Complete Work
;; Only Freelancer can call. Signals work is ready for review.
(define-public (complete-work)
    (begin
        (asserts! (is-eq tx-sender (var-get freelancer)) ERR-NOT-AUTHORIZED)
        (asserts! (is-eq (var-get current-status) STATUS-PENDING) ERR-WRONG-STATUS)
        
        (var-set current-status STATUS-WORK-DONE)
        (ok true)
    )
)


;; 3. Release Funds
;; Only Buyer can call. Transfers funds to Freelancer.
(define-public (release-funds)
    (begin
        (asserts! (is-eq tx-sender (var-get buyer)) ERR-NOT-AUTHORIZED)
        
        ;; Can release if Pending or Work Done
        (asserts! (or 
            (is-eq (var-get current-status) STATUS-PENDING)
            (is-eq (var-get current-status) STATUS-WORK-DONE)
        ) ERR-WRONG-STATUS)

        ;; Transfer funds from this contract to Freelancer
        (try! (stx-transfer? (var-get escrow-amount) current-contract (var-get freelancer)))
        
        (var-set current-status STATUS-COMPLETED)
        (ok true)
    )
)

;; 4. Dispute Escrow
;; Buyer or Freelancer can call. Freezes contract for Arbitrator.
(define-public (dispute-escrow)
    (begin
        (asserts! (or 
            (is-eq tx-sender (var-get buyer))
            (is-eq tx-sender (var-get freelancer))
        ) ERR-NOT-AUTHORIZED)

        ;; Can only dispute if active
        (asserts! (or 
            (is-eq (var-get current-status) STATUS-PENDING)
            (is-eq (var-get current-status) STATUS-WORK-DONE)
        ) ERR-WRONG-STATUS)

        (var-set current-status STATUS-DISPUTED)
        (ok true)
    )
)
