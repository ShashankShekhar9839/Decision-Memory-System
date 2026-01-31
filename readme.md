# Decision Memory System

A simple but powerful web application that helps individuals or teams **record important decisions and the reasons behind them**, so context is never lost over time.

This is **not a notes app**. It is a **decision log** — focused on _why_ something was decided.

---

## ✨ What Problem Does This Solve?

In real projects:

- Decisions are made in meetings, Slack, or PRs
- Months later, nobody remembers _why_
- The same debates happen again
- New developers are confused

This tool acts as a **long‑term memory** for decisions.

---

## 🧠 Core Idea (In One Line)

> Write down **what you decided** and **why**, and update it when your thinking changes — without deleting history.

---

## 🚀 Features (MVP)

### Authentication

- User signup & login
- Each user sees only their own decisions

### Decisions

- Create a decision with:
  - Title
  - Problem
  - Decision
  - Reason

- Default status: `Proposed`

### Decision Status

- Proposed
- Accepted
- Deprecated
- Reversed

### Decision Updates (History)

- Original decision is never edited
- Add updates when thinking changes
- Full timeline visible on decision page

### Search

- Search decisions by title or reason

---

## 🧱 Tech Stack

### Frontend

- React
- React Router
- Axios
- Modern minimal UI

### Backend

- Ruby on Rails (API‑only)
- MySQL
- Devise (authentication)

---

## 🏗️ Architecture (Simple)

```
React (UI)
   ↓ REST API
Rails (API)
   ↓
MySQL
```

---

## 📄 Pages

1. Login / Register
2. Decision List
3. Create Decision
4. Decision Detail (with updates)

---

## 📊 Data Models (Simplified)

### User

- id
- email
- password

### Decision

- title
- problem
- decision
- reason
- status (enum)
- user_id

### DecisionUpdate

- content
- decision_id
- created_at

---

## 🔁 Example Flow

1. Create decision: "Use Redis for caching"
2. Explain why the decision was made
3. Mark it as `Accepted`
4. Months later, add an update explaining a change
5. Never lose context again

---

## 🧪 Why This Project Is Strong

- Solves a **real company problem**
- Not a CRUD clone
- Shows product thinking
- Shows backend + frontend clarity
- Easy to explain in interviews

---

## 🛣️ Future Enhancements (Optional)

- Team workspaces
- Decision linking
- Tags
- Timeline visualization
- Slack / GitHub integration


## 🏁 Status

✅ MVP ready to build

This project is intentionally **simple, focused, and extensible**.
