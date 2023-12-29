import * as React from "react";
import { StyleSheet, Text, TouchableOpacity, View } from "react-native";
import { createStaticNavigation, useNavigation } from "@react-navigation/native";
import { createNativeStackNavigator } from "@react-navigation/native-stack";
import Class from "./Class";
import { FunctionPage } from "./FunctionPage";

const CustomButton = (props) => {
  const {
    style,
    title = "function",
    onPress,
  } = props;

  return (
    <TouchableOpacity style={[style, styles.center]} onPress={onPress}>
      <Text style={styles.buttonTitle}>{title}</Text>
    </TouchableOpacity>
  );

};

const Home = (props) => {

  const navigation = useNavigation();

  return (
    <View style={styles.container}>
      {/* <Page1 /> */}
      <View style={[styles.container, styles.center]}>
        <>
          <CustomButton
            style={styles.buttonStyle}
            title={"class"}
            onPress={() => {
              navigation.navigate("Class");
            }}
          />
          <CustomButton
            style={styles.buttonStyle}
            onPress={() => {
              navigation.navigate("function");
            }}
          />
        </>
      </View>
    </View>
  );
};

const MainStack = createNativeStackNavigator({
  screens: {
    Home: Home,
    Class: {
      screen: Class,
      // options: { headerShown: false }
    },
    function: {
      screen: FunctionPage,
      // options: { headerShown: false }
    },
  },
});

const Navigation = createStaticNavigation(MainStack);

export default class App extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    return <Navigation />;
  }
}

const styles = StyleSheet.create({
  container: {
    backgroundColor: "white",
    flex: 1,
  },
  center: {
    alignItems: "center",
    justifyContent: "center",
  },
  buttonStyle: {
    width: "50%",
    height: "10%",
    marginTop: 100,
    backgroundColor: "red",
  },
  buttonTitle: {
    fontSize: 20,
    color: "white",
  },
  originImage: {
    width: 240,
    height: 192,
    marginTop: 50,
  },
});
