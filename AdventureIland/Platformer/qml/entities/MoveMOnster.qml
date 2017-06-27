import QtQuick 2.0
import VPlay 2.0



TiledEntityBase {
  id: moveMonster

  entityType: "moveMonster"

//  size: 2


  Image{
      width: 20
      height: 20
      source: "../../assets/img/bird_0.png"
  }

  BoxCollider {
    id:mmb
    anchors.fill: parent
    bodyType: Body.Static
    //linearVelocity:Qt.point(300,0)
    fixture.onBeginContact: {
      var otherEntity = other.getBody().target
      if(otherEntity.entityType === "player") {
          player.contacts++
          player.x = 20
          player.y = 100
          pop.play()
      }
    }
    fixture.onEndContact: {
      var otherEntity = other.getBody().target
      if(otherEntity.entityType === "player") player.contacts--
    }
  }
}
