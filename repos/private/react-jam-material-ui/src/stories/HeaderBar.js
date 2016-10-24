import React from 'react';
import { storiesOf, action } from '@kadira/storybook';

import MuiTheme from '../MuiTheme'
import HeaderBar from '../components/HeaderBar';

storiesOf('HeaderBar')
  .addDecorator((story) => (
    <MuiTheme>
      {story()}
    </MuiTheme>
  ))
  .addWithInfo(
    'simple usage',
    `
      Plain HeaderBar
    `,
    () => (
      <HeaderBar />
    )
  )
  .addWithInfo(
    'usage with title',
    `
      Plain HeaderBar with title
    `,
    () => (
      <HeaderBar title="My Awesome Title" />
    )
  )
  .addWithInfo(
    'usage with sidebar toggle',
    `
      Plain HeaderBar with sidebar toggle
    `,
    () => (
      <HeaderBar />
    )
  )
