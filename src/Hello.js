import React, {Component, PropTypes} from 'react';

export default class Hello extends Component {
	static displayName = 'Hello';

	static propTypes = {
		name: PropTypes.string
	};

	render () {
		return <h1>Hello {this.props.name}</h1>;
	}
}
