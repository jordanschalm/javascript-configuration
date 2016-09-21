import Hello from './../Hello';
import React from 'react';
import {shallow} from 'enzyme';

test('says hello', () => {
	const tree = shallow(<Hello name="Joe" />);
	expect(tree.text()).toEqual('Hello Joe');
});
