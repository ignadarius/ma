import React from 'react';
import {
    StyleSheet,
    Text,
    View,
    TextInput,
    Picker,
    Button,
} from 'react-native';
import {AsyncStorage} from 'react-native';
import Pie from 'react-native-pie';

export default class ListDetail extends React.Component {
    constructor(props) {
        super(props);
        console.log("ID:");
        console.log(this.props.navigation.state.params.car.id);

        this.state = {
          id:this.props.navigation.state.params.car.id,
          title:this.props.navigation.state.params.car.title,
          price:this.props.navigation.state.params.car.price,
          location:this.props.navigation.state.params.car.location,
          description:this.props.navigation.state.params.car.description
        }

    }

    save() {
      console.log(this.props.navigation.state.params.car.id);
        AsyncStorage.mergeItem(this.props.navigation.state.params.car.id, JSON.stringify({
          title:this.state.title,
          price:this.state.price,
          location:this.state.location,
          description:this.state.description
        })
        ).then(() => {
            this.props.navigation.state.params.updateState();
            this.props.navigation.goBack();
        });
    }


    render() {
      let r = parseInt(this.state.price) / 100;
      let rr = (10000 - parseInt(this.state.price))/ 100;
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
                <Pie
                    radius={50}
                    series={[r, rr]}
                    colors={['lime', 'red']} />
                <Button title="save" onPress={() => this.save()}/>
            </View>
        );
    }

}
