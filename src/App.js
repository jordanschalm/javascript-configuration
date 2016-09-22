import Goodbye from './Goodbye';
import Hello from './Hello';
import React from 'react';
import ReactDOM from 'react-dom';

const App = () => (
	<div>
		<Hello name="Joe" />
		<Goodbye name="Joe" />
	</div>
);

ReactDOM.render(<App />, document.getElementById('app'));
