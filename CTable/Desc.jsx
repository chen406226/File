import React, { Component } from 'react'

export default class Desc extends Component {
  render() {
    return (
      <svg width="100%" height="100%" version="1.1"xmlns="http://www.w3.org/2000/svg">
      <rect width="2" height="30" x="24" y="0" style={{fill:'#8bc5e4',strokeWidth:1,stroke:'#8bc5e4'}}/>
      <polygon points="26,0 26,15 32,15"
      style={{fill:'#8bc5e4',stroke:'#8bc5e4',strokeWidth:1}}/>
      <rect width="2" height="30" x="16" y="0"
      style={{fill:'#0185d0',strokeWidth:1,stroke:'#0185d0'}}
      />
      <polygon points="16,30 16,15 10,15"
      style={{fill:'#0185d0',stroke:'#0185d0',strokeWidth:1}}/>
    </svg>  
    )
  }
}
