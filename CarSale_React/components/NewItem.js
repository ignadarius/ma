import React from 'react';
import {
    StyleSheet,
    Text,
    View,
    TextInput,
    Button,
    AsyncStorage,
    Picker
} from 'react-native';

export default class NewItem extends React.Component {

    constructor(props) {
        super(props);

        console.log("Rowcount:"+this.props.navigation.state.params.getCount());
        this.state = {
            id: this.props.navigation.state.params.getCount().toString(),
            title: "",
            location: "",
            price: "0",
            description:"",
            image: global.defaultImage
        };

        console.log("IDNEW:");
        console.log(this.state.id);
    }

    save() {
        AsyncStorage.setItem(this.state.id, JSON.stringify({
                id: this.state.id,
                title: this.state.title,
                price: this.state.price,
                location: this.state.location,
                description: this.state.description,
                image: this.state.image
            })
        ).then(() => {
            this.props.navigation.state.params.updateState();
            this.props.navigation.goBack();
        });
    }

    render() {
        return (
            <View>
            <Text>Title:</Text>
            <TextInput onChangeText={(title) => this.setState({title})} value={this.state.title}/>
            <Text>Price:{this.state.price}$</Text><Picker
                onValueChange={(price) => this.setState({price})}
                selectedValue={this.state.price}>
                <Picker.Item label="4000" value="4000" />
                <Picker.Item label="5000" value="5000" />
                <Picker.Item label="6000" value="6000" />
                <Picker.Item label="7000" value="7000" />
            </Picker>
            <Text>Location:</Text><TextInput onChangeText={(location) => this.setState({location})} value={this.state.location}/>
            <Text>Description:</Text><TextInput onChangeText={(description) => this.setState({description})} value={this.state.description}/>
            <Text/>
            <Text/>
            <Button title="save" onPress={() => this.save()}/>
            </View>
        );
    }
}



const styles = StyleSheet.create({
    container: {
        flex: 1,
        backgroundColor: '#fff',
        alignItems: 'center',
        justifyContent: 'center',
    },
});
