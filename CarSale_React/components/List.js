import React from 'react';
import {
    StyleSheet,
    View,
    ListView,
    TouchableOpacity,
    Text,
    Image
} from 'react-native';

export default class List extends React.Component {

    constructor(props) {
        super(props);
        var dataSource = new ListView.DataSource({ rowHasChanged: (r1,r2) => r1.Id != r2.Id});
        this.state = {
            dataSource: dataSource.cloneWithRows(global.cars)
        }
    }

    edit(item){
        this.props.navigation.navigate("ListDetail", item);
    }

    renderRow(item){
        return(
            <TouchableOpacity onPress={() => this.edit(item)}>
                <View>
                    <Text style={styles.text}>{item.title}</Text>
                    <Image 
                    style={{width: 300, height: 120,justifyContent: 'center',}}
          source={item.image}/>
                    <Text/>
                    <Text/>
                </View>
            </TouchableOpacity>
        );
    }

    render() {
        return (
            <View style={styles.container}>
                <ListView dataSource={this.state.dataSource} renderRow={this.renderRow.bind(this)} />
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
