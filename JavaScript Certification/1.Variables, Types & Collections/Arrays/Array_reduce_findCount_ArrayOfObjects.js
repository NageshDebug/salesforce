const menu = [
    {
        type: 'title',
        text: 'Works of George Macdonald',
    },
    {
        type: 'link',
        href: '/books',
        text: 'Books',
    },
    {
        type: 'link',
        href: '/poetry',
        text: 'Poems',
    },
    {
        type: 'link',
        href: '/essays',
        text: 'Essays',
    },
    {
        type: 'title',
        text: 'Our Community',
    },
    {
        type: 'link',
        href: '/about',
        text: 'About us',
    },
    {
        type: 'link',
        href: '/forum',
        text: 'Forum',
    },
    {
        type: 'link',
        href: 'https://www.facebook.com/groups/GeorgeMacDonaldCommunity/',
        text: 'Facebook Group',
    },
];
function sumLinks(total, item) {
    return total + ((item.type === 'link') ? 1 : 0);
}
const numLinks = menu.reduce(sumLinks, 0);
