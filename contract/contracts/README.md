
# 🧾 BitProof Escrow Smart Contract

**Blockchain-powered trustless escrow for freelancers and buyers on Stacks**

[![Stacks](https://img.shields.io/badge/Built%20on-Stacks-blue)](https://www.stacks.co/)
[![Clarity](https://img.shields.io/badge/Clarity-v4-purple)](https://docs.stacks.co/reference/clarity)
[![Open Source](https://img.shields.io/badge/Open%20Source-Yes-green)](https://github.com)

BitProof Escrow is a **fully on-chain escrow smart contract** built with **Clarity** on the **Stacks blockchain**, enabling secure, transparent, and trust-minimized agreements between **buyers and freelancers**, with dispute resolution via an **arbitrator**.

This contract demonstrates **real-world Stacks usage** for freelance payments, DAO work agreements, and milestone-based service delivery.

---

## 🏆 Stacks Builder Rewards – February Submission

This project is submitted for:

> **Stacks Builder Rewards: February**
> *Rewarding the most impactful Stacks builders with $STX*

**Why BitProof Escrow qualifies:**

* ✅ Real-world financial use case (freelance escrow)
* ✅ Fully deployed and verifiable on Stacks
* ✅ Uses Clarity 4 and native STX transfers
* ✅ Production-ready contract logic
* ✅ Transparent and auditable on-chain state machine

---

## 🌐 Live Deployment (Testnet)

### Contract Details

* **Network**: Stacks Testnet

* **Contract Name**: `escrowq`

* **Deployer Address**:
  `ST2W758Q6BS97GWK7STXTAW2ZG26YFXE4V5WMTG3Q`

* **Contract Identifier**:
  `ST2W758Q6BS97GWK7STXTAW2ZG26YFXE4V5WMTG3Q.escrowq`

* **Deployment Transaction ID**:
  `bfa43c4b3eb39d153c3e37ae041ed3f5b5417b958f5d91342ebdeec56b885518`


* **Explorer**:
  [https://explorer.stacks.co/address/ST2W758Q6BS97GWK7STXTAW2ZG26YFXE4V5WMTG3Q?chain=testnet](https://explorer.stacks.co/address/ST2W758Q6BS97GWK7STXTAW2ZG26YFXE4V5WMTG3Q?chain=testnet)

---

## ⚙️ Configuration

* **Clarity Version**: 4
* **Epoch**: 3.3+
* **Language**: Clarity
* **Asset Type**: STX (native)

---

## ✨ Key Features

* 🔐 **STX Escrow Locking** – Funds held directly by the contract
* 👥 **Three-Party Model** – Buyer, Freelancer, Arbitrator
* ⏳ **Deadline-Based Refunds** – Buyer protected if work is not delivered
* ⚖️ **On-Chain Dispute Resolution** – Arbitrator resolves disputes transparently
* 🧠 **Explicit Escrow State Machine**
* 🧾 **Fully On-Chain & Verifiable**
* 🚫 **No Admin Keys or Custody**

---

## 🔄 Escrow Lifecycle

| Status      | Description                    |
| ----------- | ------------------------------ |
| `PENDING`   | Escrow created, funds locked   |
| `WORK_DONE` | Freelancer marks work complete |
| `COMPLETED` | Funds released                 |
| `DISPUTED`  | Escrow under arbitration       |
| `REFUNDED`  | Buyer refunded after deadline  |

---

This contract replaces traditional escrow services with **trustless, programmable escrow on Bitcoin via Stacks**.

---

## 🚀 Getting Started

```bash
clarinet check
clarinet fmt
clarinet devnet start
```

---

## 🧠 Future Enhancements

* Multi-milestone escrows
* SIP-010 token support
* Partial fund releases
* DAO arbitrator modules
* Frontend integration using `@stacks/connect`

---

## 🤝 Contributing

This project is open source and welcomes:

* Security audits
* Test additions
* Feature extensions
* Frontend integrations

---

## 📜 License

MIT

