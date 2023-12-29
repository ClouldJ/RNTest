import { action, makeAutoObservable, observable, runInAction } from 'mobx'
import { NativeModules } from 'react-native'

class ImageStore {

  constructor() {
    makeAutoObservable(this)
  }

  @observable image = ''

  @action prepareImage() {
    NativeModules.AppBridgeModule.cutoutImage()
      .then(res => {
        runInAction(() => {
          this.image = `file:///${res}`
        })
      })
      .catch(err => {
        alert(JSON.stringify(err))
      })
  }

}

export default (new ImageStore())
