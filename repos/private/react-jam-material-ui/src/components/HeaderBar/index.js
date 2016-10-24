import React, { Component, PropTypes } from 'react'

import AppBar from 'material-ui/AppBar'
import Toggle from 'material-ui/Toggle'

class HeaderBar extends Component {
  render() {
    return (
      <AppBar
        title={this.props.title}
        // iconClassNameRight="muidocs-icon-navigation-expand-more"
        onTitleTouchTap={this.handleTouchTap}
        iconElementRight={
        <Toggle
          // style={styles.toggle}
        />
      } />
    
    )
  }
}

HeaderBar.propTypes = {
  title: PropTypes.object
}

export default HeaderBar
