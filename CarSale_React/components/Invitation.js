import React from 'react';
import {StyleSheet, View, Button, TextInput, Text, Linking} from 'react-native';

export default class Invitation extends React.Component {

    constructor(props) {
        super(props);
        this.state = {mail: "ignadarius13071996@gmail.com", subject: "Join CarSale"}
    }

    handleEmail = () => {
        var mail = this.state.mail;
        var subject = this.state.subject;

        Linking.openURL("mailto:" + JSON.stringify(mail)
            + "?subject=Invitation to our app&body=" + JSON.stringify(subject));
    }

    render() {
        return (
            <View>
                <Text>To:</Text><TextInput onChangeText={(mail) => this.setState({mail})} value={this.state.mail}/>
                <Text>Subject:</Text><TextInput onChangeText={(subject) => this.setState({subject})} value={this.state.subject}/>
                <Button
                    onPress={this.handleEmail}
                    title="Email Me"
                    color="#841584"
                    accessabilityLabel="Purple Email Me Button"
                />
            </View>
        );
    }
}

const styles = StyleSheet.create({
    container: {
        flex: 1,
        flexDirection: 'column',
        alignItems: 'center',
        justifyContent: 'center',
    },
    buttonContainer: {
        flex: 1,
    },
    rowContainer: {
        flexDirection: 'row',
        alignItems: 'center',
        justifyContent: 'center',

    }
});
