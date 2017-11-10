import React from 'react';
import {
    StyleSheet,
    Text,
    View,
    TextInput,
    Button,
} from 'react-native';

export default class ListDetail extends React.Component {
    constructor(props) {
        super(props);

        this.state = {
            id: 0,
            title: "",
            price: "",
            location: "",
            date: "",
            description:"",
        };

        if (this.props.navigation.state.params.id !== undefined) {
            var toEdit = this.props.navigation.state.params;
            this.state.id = toEdit.id;
            this.state.title = toEdit.title;
            this.state.price = toEdit.price;
            this.state.location = toEdit.location;
            this.state.description = toEdit.description;
        }

    }

    save() {
        if (this.state.id === 0) {
            var item = {
                id: global.count,
                title: this.state.title,
                price: this.state.price,
                location: this.state.location,
                description: this.state.description
            };
            global.count = global.count + 1;
            global.cars.push(item);
        }
        else {
            var item = this.state;
            for (var i = 0; i < global.cars.length; i++) {
                if (global.cars[i].id === item.id) {
                    global.cars[i] = item;
                }
            }
        }
        this.props.navigation.navigate("List");
    }

    render() {
        return (
            <View>
                <TextInput onChangeText={(title) => this.setState({title})} value={this.state.title}/>
                <Text>Price:</Text><TextInput onChangeText={(price) => this.setState({price})} value={this.state.price}/>
                <Text>Location:</Text><TextInput onChangeText={(location) => this.setState({location})} value={this.state.location}/>
                <Text>Description:</Text><TextInput onChangeText={(description) => this.setState({description})} value={this.state.description}/>
                <Button title="save" onPress={() => this.save()}/>
            </View>
        );
    }

}