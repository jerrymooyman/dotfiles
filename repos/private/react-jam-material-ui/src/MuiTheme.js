import React from 'react';
import MuiThemeProvider from 'material-ui/styles/MuiThemeProvider'
import getMuiTheme from 'material-ui/styles/getMuiTheme'
import {
  indigo900, indigo700, indigo500, redA200
} from 'material-ui/styles/colors'

const muiTheme = getMuiTheme({
  palette: {
    primary1Color: indigo500,
    primary2Color: indigo700,
    accent1Color: redA200,
    pickerHeaderColor: indigo500,
  },
  appBar: {
    height: 80
  }
})

const MuiTheme = (props) => {
  return (
    <MuiThemeProvider muiTheme={muiTheme}>
      {props.children}
    </MuiThemeProvider>
  )
}

export default MuiTheme
