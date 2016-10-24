import React, { Component, PropTypes } from 'react';

import Drawer from 'material-ui/Drawer';
import MenuItem from 'material-ui/MenuItem';
import RaisedButton from 'material-ui/RaisedButton';

class SideBar extends Component {
  render() {
    return (
      <Drawer open={this.props.open}>
        <MenuItem>Menu Item</MenuItem>
        <MenuItem>Menu Item 2</MenuItem>
      </Drawer> 
    )
  }
}

SideBar.propsTypes = {
  open: PropTypes.boolean
}

export default SideBar
