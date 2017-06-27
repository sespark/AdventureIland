import QtQuick 2.0
import VPlay 2.0

TiledEntityBase {
  id: block
  entityType: "block"

  size: 1 // must be >= 2 and even (2,4,6,...), because we got a sprite for the start, one for the end and 2 center sprites that are only repeatable if both are used

  Row {
    id: tileRow
    Tile {
      pos: "left"
      image: "../../assets/block6.png"
    }
    Repeater {
      model: size-1
      Tile {
        pos: "mid"

        image: "../../assets/ground/ground_dirt.png"
      }
    }

  }


  BoxCollider {
    id: collider
    anchors.fill: parent
    bodyType: Body.Static

    fixture.onBeginContact: {
      var otherEntity = other.getBody().target
      if(otherEntity.entityType === "player") {
        console.debug("contact platform begin")

        // increase the number of active contacts the player has
        player.contacts++
      }
    }

    fixture.onEndContact: {
      var otherEntity = other.getBody().target
      if(otherEntity.entityType === "player") {
        console.debug("contact platform end")

        // if the player leaves a platform, we decrease its number of active contacts
        player.contacts--
      }
    }
  }
}
