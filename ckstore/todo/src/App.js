import React, { Component } from 'react';
import logo from './logo.svg';
import './App.css';
import {create,connect} from 'ckstore'
import * as action from './action'

class App extends Component {
  render() {
    return (
      <div className="App">
        <TodoChild></TodoChild>
      </div>
    );
  }
}

class TodoChild extends Component {
  render() {
    return (<div>
      <h3>ckstore</h3>
      <p>年龄：{this.props.age}</p>
      <button onClick={this.props.cancel}>---------</button>
      <button onClick={this.props.add}>+++++++++</button>
      <p>名字{this.props.name}</p>
      <button onClick={()=>{this.props.changename('k','d')}}>changename</button>
    </div>)
  }
}
TodoChild = connect(TodoChild)

App = create({name:'wq',age:18,sex:'wm'},action,App)
export default App;
