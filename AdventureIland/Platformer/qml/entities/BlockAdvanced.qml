import QtQuick 2.0
import VPlay 2.0

TiledEntityBase {
    id: blockAdvanced
    entityType: "blockAdvanced"

    size: 1 // must be >= 2 and even (2,4,6,...), because we got a sprite for the start, one for the end and 2 center sprites that are only repeatable if both are used

    Row {
        id: tileRow
        Tile {
            pos: "left"
            image: "../../assets/newimg/struct/gold_block.png"
        }
        Repeater {
            model: size-1
            Tile {
                pos: "mid"
                image: "../../assets/struct/gold_block.png"
            }
        }

    }
//    Star{
//        id:bs
//        anchors.bottom: blockAdvanced.bottom
//        //anchors.top:blockAdvanced.top
//        anchors.left: blockAdvanced.left
//    }
//    Rectangle{
//        id:bs
//        width: 32
//        height: 32
//        anchors.left: blockAdvanced.left
//        anchors.top: blockAdvanced.top
//        color:"yellow"
//        visible: false

//    }


    BoxCollider {
        id: collider
        anchors.fill: parent
        bodyType: Body.Static
        fixedRotation: true
        bullet: true
        sleepingAllowed: false
        force: Qt.point(0,25)




        fixture.onBeginContact: {
            var otherEntity = other.getBody().target
            if(otherEntity.entityType === "player") {


                console.debug("contact platform begin")
                collider.linearVelocity.y = -620
                if(otherEntity.y+otherEntity.height >= blockAdvanced.y/*&&(otherEntity.x > blockAdvanced.x -6*//*||otherEntity.x < blockAdvanced.x + 6) */){
                   collider.bodyType = Body.Dynamic
                    //bs.anchors.bottom = blockAdvanced.top
                    //bs.visible = true
                }



                // increase the number of active contacts the player has
                player.contacts++

            }
            bs.visible = ture
        }

        fixture.onEndContact: {
            var otherEntity = other.getBody().target
            if(otherEntity.entityType === "player") {
                console.debug("contact platform end")

                // if the player leaves a platform, we decrease its number of active contacts


                var xposition = blockAdvanced.x
                var yposition = blockAdvanced.y
                if (blockAdvanced.x===xposition&&blockAdvanced.y === yposition){
                    collider.bodyType = Body.Static
               }
                player.contacts--
            }
        }
    }
}
