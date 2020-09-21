import React from 'react';
import {render, fireEvent, wait} from '@testing-library/react';
import App from './App';

const contact = {
    id: 1,
    first_name: 'Paco',
    last_name: 'Perez',
    phone: '1234567890',
    email: 'paco@gmail.com'
};

function mockFetch(data) {
    return jest.fn().mockImplementation(() =>
        Promise.resolve({
            ok: true,
            json: () => data
        })
    );
}

describe('edit and delete', () => {
    beforeEach(() => {
        window.fetch = mockFetch([contact]);
    });

    test('should delete a contact, removing it from the list', async () => {
        const {getByText, queryByText} = render(<App/>);

        await wait(() => {
            const deleteButton = getByText('delete');

            window.confirm = jest.fn(() => true);
            fireEvent.click(deleteButton);
        });

        await wait(() => {
            expect(queryByText(`${contact.first_name} ${contact.last_name}`)).not.toBeInTheDocument();
        });
    });
});
