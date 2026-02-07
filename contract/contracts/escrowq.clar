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
