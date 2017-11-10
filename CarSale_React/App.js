/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 * @flow
 */
import React from 'react';
import {StackNavigator} from 'react-navigation';
import Main from "./components/Main";
import Invitation from "./components/Invitation";
import List from "./components/List";
import ListDetail from "./components/ListDetail";

var audiPic = require('./Resources/audi.jpeg')
var bmwPic = require('./Resources/bmw.jpeg')

global.cars = [{id:1, title:"Audi", price:"5000$", location:"Zalau", date:"10.11.2017", 
                description:"Audi A4 from 2005 with full option", image:audiPic},
              {id:2, title:"BMW", price:"6000$", location:"Cluj-Napoca", date:"10.11.2017", 
                description:"I seel my BMW in very good condition", image:bmwPic}]
global.count = 2;

const App = StackNavigator({
    Main:{
        screen: Main,
    },
    Invitation: {
        screen: Invitation,
    },
    List: {
        screen: List,
    },
    ListDetail: {
        screen: ListDetail,
    }
});


export default App;