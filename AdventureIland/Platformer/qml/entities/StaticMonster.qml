import QtQuick 2.0
import VPlay 2.0

TiledEntityBase {
  id: staticMonster

  entityType: "staticMonster"

//  size: 2

  Image{
      width: 20
      height: 20
      source: "../../assets/newimg/monster/opponent_walker.png"
  }

  BoxCollider {
    anchors.fill: parent
    bodyType: Body.Static
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
