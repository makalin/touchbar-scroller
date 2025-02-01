# MacBook Touch Bar Scrolling Text

A simple macOS application that displays scrolling text animation on the MacBook Pro Touch Bar. The app creates a smooth scrolling text effect that continuously moves across the Touch Bar, similar to classic marquee text displays.

## Features

- Smooth scrolling text animation on the Touch Bar
- Customizable text content
- Optional window interface
- Automatic Touch Bar integration
- Supports background operation

## Requirements

- MacBook Pro with Touch Bar
- macOS 10.12.2 or later
- Xcode 12.0 or later
- Swift 5.0 or later

## Installation

1. Clone this repository:
```bash
git clone https://github.com/makalin/touchbar-scroller.git
```

2. Open the project in Xcode
3. Build and run the application

## Usage

The application will automatically start displaying scrolling text on your Touch Bar once launched. The default text message can be modified by changing the `text` property in `AppDelegate.swift`:

```swift
var text: String = "MacBook Touch Bar Scrolling Text! "
```

The scrolling speed can be adjusted by modifying the timer interval in the `startScrollingText()` method:

```swift
timer = Timer.scheduledTimer(withTimeInterval: 0.2, repeats: true) { _ in
    self.updateText()
}
```

## How It Works

The application uses the following key components:

- `NSTouchBarDelegate`: Handles Touch Bar integration
- `NSCustomTouchBarItem`: Creates a custom Touch Bar item
- `Timer`: Controls the scrolling animation
- `NSTextField`: Displays the scrolling text

The text scrolling is achieved by continuously rotating the first character of the text string to the end, creating a smooth scrolling effect.

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

[MIT License](LICENSE)

## Acknowledgments

- Apple's Touch Bar API Documentation
- macOS Development Community
