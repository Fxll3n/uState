# 🧠 uState

**uState** is a barebones Finite State Machine (FSM) plugin that introduces two lightweight, powerful nodes for managing stateful logic in your projects.

Ideal for those looking for a minimal and flexible approach to FSM implementation, **uState** provides the fundamental tools needed to build and manage behavioral states through visual node-based logic.

---

## ⚙️ Nodes Overview

### 🧩 `uState`

The **`uState`** node represents a single, reusable **state template**. It's the foundational block used by the `uMachine` node to define specific behaviors.

- Encapsulates logic that executes when the state is active.
- Can be customized to represent unique behaviors or actions in your state machine.

### 🧠 `uMachine`

The **`uMachine`** node is the **state machine controller**. It handles the transition between different `uState` nodes based on your logic.

> ⚠️ **Important:** A `uMachine` **must** include **at least one** `uState` node to function properly.

- Manages state transitions.
- Coordinates which `uState` is currently active.
- Can evaluate conditions or triggers to switch states.

---

## 🚀 Getting Started

1. **Install the plugin** into your project.
2. Install the plugin from the Asset Library or by downloading the `.zip` from the repository.
3. Add a `uMachine` node and `uState` nodes as children.
4. Create scripts that extend `uState` and drag them onto your `uState` nodes. (I recomend making a different base_state.gd for different enities. Example included in the plugin)
5. To transition to a new `uState`, in your script (eg. IdleState.gd) use the built in method `transition_to(new_state: StringName)`. (Note that the value passed will automatically be converted to all lowecase.)
---

## 📌 Features

- 🧼 Minimal, clean FSM design
- 🧱 Modular `uState` templates for reusability
- 🔄 Controlled state transitions via `uMachine`
- 🛠️ Easy integration with node-based environments

---

## 📝 License

This project is open-source and available under the [MIT License](LICENSE).

---

## 🙌 Contributions

Feel free to fork, submit pull requests, or suggest features and improvements!

---

Happy statemachining! 😄
