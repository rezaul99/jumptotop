# jumptotop
With this ready made floating button you can jump to the top of your view

### demo 
![videofile](https://cloud.githubusercontent.com/assets/22488630/19361467/97d0ca40-91a4-11e6-9b6d-4811bc47bd0b.gif)

### usage
Step 1:instantiate:

```swift
  let floatingBtn = JumpToTop()
```
Step 2:In viewDidLoad
```swift
  self.scrollView.delegate = floatingBtn.self
  floatingBtn.drawfloatingButton(addToView: self.contentView,
                                       andTopView:self.view)
        floatingBtn.floatingButton.addTarget(self, action: #selector(ViewController.buttonTapped), for: .touchUpInside)
```

Step 3:Within your class

```swift
      func buttonTapped() {
        self.scrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
    }
```
Thats it...

### changing button color
just add one of nine colors given for you like this
```swift
        floatingBtn.drawfloatingButton(addToView: self.contentView,
                                       andTopView:self.view,
                                       andColor:.blue)

```


