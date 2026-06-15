# 🖼️ Windows Photo Viewer – PowerShell Recreation

A PowerShell + WPF image viewer inspired by the classic Windows 7 Photo Viewer. It provides image browsing, zooming, slideshow playback, drag-and-drop support, deletion to the Recycle Bin, and a dark Aero-style interface.

<img width="1184" height="843" alt="image" src="https://github.com/user-attachments/assets/9339daff-9e6e-4497-a22d-68d61eed5c56" />

## ✨ Features

### Image Viewing
- Opens `jpg`, `jpeg`, `png`, `bmp`, `gif`, `tiff`, `tif`, and `ico` files
- Loads and displays images with high-quality scaling
- Automatically fits the image to the window when opened
- Shows image dimensions, file size, and position in the current image list

### Navigation
- Previous and Next buttons
- Left and Right arrow key navigation
- If a single file is opened, the script scans the containing folder and builds an image list
- Displays the current image count such as `3 of 20`

### 🔍 Zoom and Pan
- Zoom In and Zoom Out buttons
- Mouse wheel zooming
- Best Fit button and keyboard shortcut
- Actual size option from the context menu
- Click-and-drag panning inside the scroll viewer

### 🎬 Fullscreen Slideshow
- Fullscreen overlay mode with automatic advance every 5 seconds
- Pause and resume support
- Previous and Next controls in fullscreen
- Double-click or `F11` toggles fullscreen
- `Esc` exits fullscreen

### 🗑️ File Management
- Delete button moves the current file to the Recycle Bin
- Confirmation prompt before deletion
- Automatically updates the image list after deleting a file

### 📂 Open Methods
- `Ctrl+O` file open dialog
- Placeholder button when no image is loaded
- Right-click context menu
- Drag and drop files or folders onto the window
- Command-line file path support on launch

### 🎨 UI Styling
- WPF interface built from XAML
- Dark Aero-inspired gradients and glass styling
- Bottom toolbar with centered controls
- Hover and pressed button states
- Placeholder view when no image is selected

## ⌨️ Keyboard Shortcuts

- `Ctrl+O` — Open image
- `Left Arrow` — Previous image
- `Right Arrow` — Next image
- `F` — Best fit
- `+` / `-` — Zoom in / Zoom out
- `F11` — Toggle fullscreen slideshow
- `Esc` — Exit fullscreen
- `Delete` — Move current image to Recycle Bin

## 🖱️ Mouse Controls

- Mouse wheel — Zoom in or out
- Left click + drag — Pan image
- Double-click — Toggle fullscreen
- Right-click — Open context menu
- Drag and drop — Load files or folders

## ⚙️ How It Works

### UI Layer
The script defines the full application window in XAML, including the main image display area, scroll viewer for pan support, bottom toolbar, placeholder panel, context menu, and fullscreen slideshow overlay.

### Image Loading
Images are loaded synchronously from disk using `BitmapImage` and a `MemoryStream`. This avoids common file locking issues and keeps the display stable.

### Zoom System
The script maintains a current zoom level, a fit-to-window zoom level, and preset zoom steps for button-based zooming. Zoom is applied using a `ScaleTransform` attached to the image.

### Navigation System
The script stores image paths in a generic list and tracks the current index. Previous and next operations wrap around the list.

### Slideshow Engine
A `DispatcherTimer` advances the current image every 5 seconds while fullscreen slideshow mode is active.

### 📝 Logging
A debug log captures application startup, image loading attempts, load failures, and file open activity. Logs can be copied to the clipboard from the context menu.

## 🗂️ Supported Formats

- `.jpg` `.jpeg` `.png` `.bmp` `.gif` `.tiff` `.tif` `.ico`

## 🔧 Technical Summary

- Language: PowerShell
- UI Framework: WPF
- Layout: XAML loaded at runtime
- Image Rendering: `System.Windows.Controls.Image`
- Zoom: `ScaleTransform`
- Slideshow Timer: `DispatcherTimer`
- Recycle Bin Delete: `Microsoft.VisualBasic.FileIO.FileSystem`

## 🚀 Usage

Run the script in PowerShell. You can launch it empty and open images manually, drag files or folders into the window, or pass an image path as a command-line argument.

## Summary

This script recreates a Windows Photo Viewer-style experience in PowerShell with image viewing, folder-based browsing, zoom and pan, fullscreen slideshow, delete to Recycle Bin, drag-and-drop support, debug logging, and a custom dark Aero-inspired interface.
