import React from 'react';
import {
    StyleSheet,
    View,
    ListView,
    Button,
    TouchableOpacity,
    Text,
    Alert,
    Image
} from 'react-native';
import {AsyncStorage} from 'react-native';

export default class List extends React.Component {

    constructor(props) {
        super(props);
        this.state = {data_source: global.data_source.cloneWithRows([])};
        // AsyncStorage.clear();
        // for(let car of global.cars)
        // {
        //   AsyncStorage.setItem(car.id, JSON.stringify({
        //     id: car.id,
        //     title: car.title,
        //     price: car.price,
        //     location: car.location,
        //     description: car.description,
        //     image: car.image
        //   }));
        // }
        this.updateState();
    }

    getCount(){
      return this.state.data_source.getRowCount() + 1;
    }

    updateState() {
        AsyncStorage.getAllKeys().then((keys) => {
            for (keyIndex in keys) {
                cars = []
                AsyncStorage.getItem(keys[keyIndex]).then((value) => {
                    cars.push(JSON.parse(value));
                    console.log(cars);
                    this.setState({data_source: global.data_source.cloneWithRows(cars)});
                })
            }
        });

    }

    edit(item){
        this.props.navigation.navigate("ListDetail", {car: item, updateState: this.updateState.bind(this)});
    }

    renderRow(item){
        console.log(item.id);
        return(
            <TouchableOpacity onPress={() => this.edit(item)}>
                <View>
                    <Text style={styles.text}>{item.title}</Text>
                    <Image
                    style={{width: 300, height: 120,justifyContent: 'center',}}
          source={item.image}/>
                    <Button title="REMOVE" color='#FF0000' onPress={() => {
                            Alert.alert(
                            'Are you sure you want to delete this item?',
                            '',
                            [
                              {text: 'No', onPress: () => {}, style: 'cancel'},
                              {text: 'Yes', onPress: () =>
                                  AsyncStorage.removeItem(item.id).then(() => {
                                  console.log("Update state remove");
                                  this.updateState();
                              })},
                            ],
                            { cancelable: true }
                            );
                            }
                            }
                    />
                    <Text/>
                    <Text/>

                </View>
            </TouchableOpacity>
        );
    }

    render() {
        return (
            <View style={styles.container}>
            <Button title="Add"
                    onPress={() => this.props.navigation.navigate('NewItem', {getCount: this.getCount.bind(this), updateState: this.updateState.bind(this)})}/>
                <ListView dataSource={this.state.data_source} renderRow={this.renderRow.bind(this)}/>
            </View>
        );
    }
}

const styles = StyleSheet.create({
    rowcontainer: {
        flexDirection: 'row',
        alignItems: 'center',
        justifyContent: 'center',
    },
    row: {
    marginBottom: 2
    },
    container: {
        flexDirection: 'column',
        alignItems: 'center',
        justifyContent: 'center',
        padding: 10,
    },
    text: {
        marginLeft: 12,
        fontSize: 16,
        flexDirection: 'column',
        textAlign: 'center'
    },
});
