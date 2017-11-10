import React from 'react';
import {
    StyleSheet,
    View,
    Button,
    Text,
} from 'react-native';

export default class Main extends React.Component {

    constructor(props) {
        super(props);
    }

    render() {
        return (
            <View>
            <Text style={{textAlign:'center',fontSize:30}}>Car Sale</Text>
            <View style={styles.container}>
                <View style={styles.buttonContainer}>
                    <Button
                        onPress={() => this.props.navigation.navigate('Invitation')}
                        title="Invitation to our app"
                        color="#ce42f4"
                    />
                </View>

                <View style={styles.buttonContainer}>
                    <Button
                        onPress={() => this.props.navigation.navigate('List')}
                        title="See Cars"
                    />
                </View>
            </View>
            </View>
        );
    }
}

const styles = StyleSheet.create({
    container: {
        flex: 1,
        flexDirection: 'row',
        alignItems: 'center',
        justifyContent: 'center',
    },
    buttonContainer: {
        flex: 1,
    }
});
