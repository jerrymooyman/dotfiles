import React, { Component } from 'react';
import { storiesOf, action } from '@kadira/storybook';

import MuiTheme from '../MuiTheme'
import SideBar from '../components/SideBar';

import RaisedButton from 'material-ui/RaisedButton';

storiesOf('SideBar')
  .addWithInfo(
    'simple usage',
    `
      Plain HeaderBar
    `,
    () => (
      <SimpleUsage />
    )
  )

class SimpleUsage extends Component {
  constructor(props) {
    super(props)
    this.state = {
      open: false
    }
  }
  render() {
    return (
      <MuiTheme>
        <div>
          <SideBar open={this.state.open}/>
          <br />
          <p>
            Click button to toggle SideBar
          </p>
          <RaisedButton 
            label='Toggle'
            primary={true}
            style={{float: 'right'}}
            onClick={() => {this.setState({
              open: !this.state.open
            })}} />
        </div>
      </MuiTheme>
    );
  }
}
