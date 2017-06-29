import VPlay 2.0
import QtQuick 2.0
import "scenes"

GameWindow {
    id: gameWindow

    screenWidth: 960
    screenHeight: 640

    EntityManager {
        id: entityManager
    }

    MenuScene {
        id: menuScene
        onPlayPressed: {
            gameWindow.state = "levelScene"
            //            menuScene.opacity = 0
        }
        onBackButtonPressed: nativeUtils.displayMessageBox(
                                 "Really qiut the game?", "", 2)
        Connections {
            target: nativeUtils
            onMessageBoxFinished: {
                if (accepted && gameWindow.activeScene === menuScene)
                    Qt.quit()
            }
        }
    }

    GameScene {
        id: gameScene
        onBackButtonPressed: {
            gameWindow.state = "levelScene"
            //            gameScene.opacity = 0
            gameScene.restartPlayer()
        }
        onTimeEnded: {
            gameWindow.state = "levelScene"
            gameScene.restartPlayer()
            gameScene.setLevel("")
        }
        onGameOver: {
            gameWindow.state = "levelScene"
            gameScene.restartPlayer()
            gameScene.setLevel("")
        }
    }

    LevelScene {
        id: levelScene
        onBackButtonPressed: gameWindow.state = "menuScene"
        onLevelPressed: {
            //selectedLevelFileName是信号levelPressed的参数
            gameScene.setLevel(selectedLevelFileName)
            gameWindow.state = "gameScene"
            //            levelScene.opacity = 0
        }
    }

    //    PauseScene {
    //        id: pauseScene
    //        onReselectLevelButtonPressed: gameWindow.state = "levelScene"
    //        onRestartButtonPressed: gameWindow.state = "gameScene"
    //        onQuitButtonPressed: Qt.quit()
    //    }
    state: "menuScene"
    activeScene: menuScene

    states: [
        State {
            name: "menuScene"
            PropertyChanges {
                target: menuScene
                opacity: 1
            }
            PropertyChanges {
                target: gameWindow
                activeScene: menuScene
            }
        },
        State {
            name: "gameScene"
            PropertyChanges {
                target: gameScene
                opacity: 1
            }
            PropertyChanges {
                target: gameWindow
                activeScene: gameScene
            }
        },
        State {
            name: "levelScene"
            PropertyChanges {
                target: levelScene
                opacity: 1
            }
            PropertyChanges {
                target: gameWindow
                activeScene: levelScene
            }
        },
        State {
            name: "PauseScene"
            PropertyChanges {
                target: pauseScene
                opacity: 1
            }
            PropertyChanges {
                target: gameWindow
                activeScene: pauseScene
            }
        }
    ]
}
