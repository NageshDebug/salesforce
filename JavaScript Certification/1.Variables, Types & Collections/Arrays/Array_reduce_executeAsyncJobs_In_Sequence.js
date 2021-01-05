const fetch = require('node-fetch');

const peopleArr = [
    {
        username: 'glestrade',
        displayname: 'Inspector Lestrade',
        email: 'glestrade@met.police.uk',
        authHash: 'bdbf9920f42242defd9a7f76451f4f1d',
        lastSeen: '2019-05-13T11:07:22+00:00',
        id: 1
    },
    {
        username: 'mholmes',
        displayname: 'Mycroft Holmes',
        email: 'mholmes@gov.uk',
        authHash: 'b4d04ad5c4c6483cfea030ff4e7c70bc',
        lastSeen: '2019-05-10T11:21:36+00:00',
        id: 2
    },
    {
        username: 'iadler',
        displayname: 'Irene Adler',
        email: null,
        authHash: '319d55944f13760af0a07bf24bd1de28',
        lastSeen: '2019-05-17T11:12:12+00:00',
        id: 3
    },
];
function fetchMessages(username) {
    let url = `https://jsonplaceholder.typicode.com/users/${username}`;
    return fetch(url)
        .then(response => response.json());
}

function getUsername(person) {
    return person.id;
}

async function chainedFetchMessages(p, username) {
    // In this function, p is a promise. We wait for it to finish,
    // then run fetchMessages().
    const obj = await p;
    const data = await fetchMessages(username);
    return { ...obj, [username]: data };
}

const msgObj = peopleArr
    .map(getUsername)
    .reduce(chainedFetchMessages, Promise.resolve({}))
    .then(console.log);
// ⦘ {glestrade: [ … ], mholmes: [ … ], iadler: [ … ]}