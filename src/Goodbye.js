import React, {Component, PropTypes} from 'react';

export default class Goodbye extends Component {
	static displayName = 'Goodbye';

	static propTypes = {
		name: PropTypes.string
	};

	render () {
		return <h1>Goodbye {this.props.name}</h1>;
	}
}
