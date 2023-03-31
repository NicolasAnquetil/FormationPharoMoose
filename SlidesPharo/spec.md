---
marp: true
title: Spec
description: Pharo Training
author: Santiago Bragagnolo
---

<!-- headingDivider: 1 -->
<!-- paginate: true -->
<!-- footer: "Pharo -- Le langage" -->

# Building UIs with Spec

- Model View Presenter 
- Object Oriented





# The MVP pattern
![bg right:55% h:450](./Images/mvp.png)

- Model
- View
- Presenter 




# Defining a presenter


- Subclass `SpPresenter`
    - `#defaultLayout`
    - `#initializePresenters`
    - `#connectPresenter`



# #defaultLayout
![bg right:45% h:300](./Images/defaultLayout.svg)

```St
defaultLayout
  ^ SpBoxLayout newLeftToRight
      add: (SpBoxLayout newTopToBottom
        add: #title
          height: self toolbarHeight;
        add: #date
          height: self toolbarHeight;
        add: #details);
      add: (SpBoxLayout newTopToBottom
        add: #name
          height: self toolbarHeight;
        add: #table;
        add: (SpBoxLayout newLeftToRight
          add: #ok;
          add: #cancel));
      yourself
  ```


# #initializePresenters
![bg right:45% h:300](./Images/initializepresenters.svg)

```St
initializePresenters
  title := self newDropList .
  name := self newDropList .
  date := self newTextInput .
  details := self newText.
  table := self newTable.
  ok := self newButton
    label:#ok;
	yourself.
  cancel := self newButton
    label:#cancel;
	yourself.
  ```
# #connectPresenters
![bg right:45% h:300](./Images/connectPresenters.svg)

```St
connectPresenters 
  ok action: [
    self inform:'Ok'
  ].
  cancel action: [
    self inform:'Cancel'
  ].
  ```


# Binding the model
![bg right:45% h:300](./Images/setmodel.svg)

```St
model: aModel
  model := aModel.
  self modelChanged.
```
```St
modelChanged
  self fillWidgetWithModel
```
```St
fillWidgetWithModel
  title selectedItem: model title.
  name selectedItem: model name. 
  date text: model birthDate. 
  details text: model details. 
  ```
