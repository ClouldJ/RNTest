import { inject, observer } from 'mobx-react'
import * as React from 'react'
import { Image, NativeModules, View } from 'react-native'
import Content from './Content'
import ImageStore from './ImageStore'

@observer
export default class Class extends React.Component {

  constructor() {
    super()
  }

  componentDidMount() {
    ImageStore.prepareImage()
  }

  render() {
    const {
      image
    } = ImageStore

    return <Content final={image} />
  }

}
