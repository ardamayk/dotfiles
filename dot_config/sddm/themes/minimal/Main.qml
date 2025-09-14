import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Window 2.15   // Bunu ekle
import SddmComponents 2.0

Rectangle {
  width: Screen.width
  height: Screen.height
  color: "#111111"   // Arka plan (istersen background.png koyabilirsin)

  Image {
    anchors.fill: parent
    source: "./catppuctin.jpg"
    fillMode: Image.PreserveAspectCrop
  }

  // Ortada parola kutusu
  PasswordBox {
    id: password
    anchors.centerIn: parent
    width: parent.width * 0.2
    height: parent.height * 0.05
    font.pixelSize: 20
    focus: true

    Keys.onReturnPressed: sddm.login("r", password.text, "Hyprland")

    // Placeholder efekti
    Text {
      text: "Little ponny..?"
      anchors.centerIn: parent
      color: "#888"
      visible: password.text.length === 0
    }
  }
  // Enter tuşu yerine buton istersen
  Button {
    text: "Log In"
    anchors.top: password.bottom
    anchors.horizontalCenter: parent.horizontalCenter
    anchors.topMargin: 20
    onClicked: sddm.login("r", password.text, "Hyprland")
  }
}
