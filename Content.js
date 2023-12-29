import * as React from 'react'
import { Image, StyleSheet, View } from 'react-native'

export default class Content extends React.Component {
  constructor(props) {
    super(props)
  }

  render() {
    const { final } = this.props

    return (
      <View style={[styles.container, { alignItems: 'center' }]}>
        <Image source={{ uri: 'origin' }} style={styles.originImage} />
        <Image source={{ uri: 'mask' }} style={styles.originImage} />
        <Image source={{ uri: final }} style={styles.originImage} />
      </View>
    )
  }
}

const styles = StyleSheet.create({
  container: {
    backgroundColor: 'white',
    flex: 1
  },
  center: {
    alignItems: 'center',
    justifyContent: 'center'
  },
  buttonStyle: {
    width: '50%',
    height: '10%',
    marginTop: 100,
    backgroundColor: 'red'
  },
  buttonTitle: {
    fontSize: 20,
    color: 'white'
  },
  originImage: {
    width: 240,
    height: 192,
    marginTop: 25
  }
})
