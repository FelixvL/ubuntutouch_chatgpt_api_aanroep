/*
 * Copyright (C) 2025  fts
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; version 3.
 *
 * chatgptapitrial is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

import QtQuick 2.7
import Lomiri.Components 1.3
//import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import Qt.labs.settings 1.0
import io.thp.pyotherside 1.4

MainView {
    id: root
    objectName: 'mainView'
    applicationName: 'chatgptapitrial.fts'
    automaticOrientation: true

    width: units.gu(45)
    height: units.gu(75)

    Page {
        anchors.fill: parent

        header: PageHeader {
            id: header
            title: i18n.tr('chatgptapitrial')
        }

        Label {
            id: textInMidden

            wrapMode: Text.WordWrap
            
            anchors {
                top: header.bottom
                left: parent.left
                right: parent.right
                bottom: parent.bottom
            }
            text: i18n.tr('Bouw je boodschappenlijstje')

            verticalAlignment: Label.AlignVCenter
            horizontalAlignment: Label.AlignHCenter

            TextField{
                id: mijnInvoer
                anchors.left: parent.left
                
            }
            
        }
        Button{
                id: button
                text:"AddItem"
                color:"red"

                onClicked: {
                    var de_vraag = mijnInvoer.text;
                    python.call('example.speak', [de_vraag], function(returnValue) {
                    console.log('example.speak returned ' + returnValue);
                    textInMidden.text = returnValue;
                })
                }

                anchors {
                    top: header.bottom
                    right: parent.right
                }
                anchors.rightMargin: units.gu(2)

            }
    }

    Python {
        id: python

        Component.onCompleted: {
            addImportPath(Qt.resolvedUrl('../src/'));
            addImportPath(Qt.resolvedUrl('../lib/'));

            importModule('example', function() {
                console.log('module imported');
                // python.call('example.speak', ['Hello World!'], function(returnValue) {
                //     console.log('example.speak returned ' + returnValue);
                // })
            });
        }

        onError: {
            console.log('python error: ' + traceback);
        }
    }
}
