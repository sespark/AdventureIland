import VPlay 2.0
import QtQuick 2.0
import "../entities"
import "." as Levels

Levels.LevelBase {
  id: level
  // we need to specify the width to get correct debug draw for our physics
  // the PhysicsWorld component fills it's parent by default, which is the viewPort Item of the gameScene and this item uses the size of the level
  // NOTE: thy physics will also work without defining the width here, so no worries, you can ignore it untill you want to do some physics debugging
  width: 42 * gameScene.gridSize // 42 because our last tile is a size 30 Ground at row 12

  // you could draw your level on a graph paper and then add the tiles here only by defining their row, column and size
  Ground {
    row: 0
    column: 0
    size: 6
  }
  Ground {
    row: 8
    column: 0
    size: 2
  }
  Ground {
    row:10
    column: 0
    size:53
  }
  Ground {
    row:65
    column: 0
    size:16
  }
  Ground {
    row:83
    column: 0
    size:2
  }
  Ground {
    row:87
    column: 0
    size:6
  }
  Ground {
    row:95
    column: 0
    size:31
  }



  Block {
    row: 7
    column: 3
    size: 1
  }
  Block {
    row: 9
    column: 3
    size: 1
  }
  Block {
    row: 10
    column: 3
    size: 1
  }

  Block {
    row: 13
    column: 4
    size: 1
  }

  Block {
      row:17
      column: 4
      size:3
  }

  Block {
    row: 33
    column: 3
    size: 2
  }
  Block {
    row: 54
    column: 3
    size: 2
  }

  Block {
    row: 57
    column: 1
    size: 5
  }

  Block {
      row:59
      column: 2
      size:3
  }

  Block {
    row: 60
    column: 3
    size: 2
  }
  Block {
    row: 61
    column: 4
    size: 1
  }

  Block {
    row: 61
    column: 5
    size: 1
  }
  Block {
    row: 61
    column: 6
    size: 1
  }

  Block {
      row:61
      column: 7
      size:1
  }

  Block {
    row: 75
    column: 3
    size: 1
  }
  Block {
    row: 78
    column: 3
    size: 1
  }

  Block {
    row: 96
    column: 3
    size: 5
  }
  Block {
      row:97
      column: 1
      size:3
  }
  Block {
    row: 101
    column: 2
    size: 3
  }
  Block {
    row: 102
    column: 4
    size: 2
  }

  Block {
    row: 101
    column: 5
    size: 1
  }

  Block {
      row:104
      column: 5
      size:1
  }
  Block {
    row: 105
    column: 6
    size: 2
  }
  Block {
    row: 114
    column: 4
    size: 3
  }

  BlockAdvanced {
      row:8
      column: 3
      size:1
  }
  BlockAdvanced {
      row:9
      column: 5
      size:1
  }
  BlockAdvanced {
      row:10
      column: 3
      size:1
  }
  BlockAdvanced {
      row:22
      column: 3
      size:2
  }
  BlockAdvanced {
      row:52
      column: 3
      size:2
  }
  BlockAdvanced {
      row:76
      column: 3
      size:2
  }
  BlockAdvanced {
      row:100
      column: 6
      size:1
  }
  Bucket{
      row: 15
      column:2
      size:2
  }
  Bucket{
      row:42
      column: 2
      size:2
  }
  Bucket{
      row:48
      column:3
      size:3
  }
  Bucket{
      row:66
      column: 2
      size:2
  }

  Bucket{
      row:72
      column: 3
      size:3
  }
  Bucket{
      row:109
      column: 3
      size:3
  }
  StaticMonster{
      row:6
      column: 1
  }
  StaticMonster{
      row:13
      column: 5
  }
  StaticMonster{
      row:33
      column: 4
  }
  StaticMonster{
      row:45
      column: 1
  }
  StaticMonster{
      row:87
      column: 1
  }
  Coin{
      id:co
      row:26
      column: 3
  }
  Coin{
      row:27
      column: 4
  }
  Coin{
      row:28
      column: 5
  }

  Coin{
      row:29
      column: 4
  }
  Coin{
      row:30
      column: 3
  }
  Coin{

      row:36
      column: 3
  }
  Coin{
      row:37
      column: 4
  }
  Coin{
      row:38
      column: 5
  }

  Coin{
      row:39
      column: 4
  }
  Coin{
      row:40
      column: 3
  }

  Star{
      row:69
      column: 5
  }

  Star{
      row:46
      column: 5
  }

  Star{
      row:103
      column: 6
  }
//  CoinList{
//      x:96
//      y:96
//  }

  Flagpole{
      row:124
      column: 1
  }
  Flag{
      row:124
      column: 4
  }

  MoveMOnster{
      id:mm
      row:2
      column: 4
      function back(){
          if(x == 6*gameScene.gridSize){
              na.from = 6*gameScene.gridSize
              na.to = 2*gameScene.gridSize
              na.start()
          }
          if(x == 2*gameScene.gridSize){
              na.from = 2*gameScene.gridSize
              na.to = 6*gameScene.gridSize
              na.start()
          }
      }

      NumberAnimation on x{
          id:na
          from:2*gameScene.gridSize
          to:6*gameScene.gridSize
          duration: 4000
          onStopped: mm.back()
      }

   }

  MoveMOnster{
      id:mm2
      row:68
      column: 1
      function back(){
          if(x == 71*gameScene.gridSize){
              na2.from = 71*gameScene.gridSize
              na2.to = 68*gameScene.gridSize
              na2.start()
          }
          if(x == 68*gameScene.gridSize){
              na2.from = 68*gameScene.gridSize
              na2.to = 71*gameScene.gridSize
              na2.start()
          }
      }

      NumberAnimation on x{
          id:na2
          from:68*gameScene.gridSize
          to:71*gameScene.gridSize
          duration: 4000
          onStopped: mm2.back()
      }

   }
}
