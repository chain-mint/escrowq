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