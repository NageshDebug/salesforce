import { LightningElement } from 'lwc';

export default class ConditionalRendering7 extends LightningElement {
    records = [{
        "id": 1,
        "name": "Anne",
        "isSelected": false,
        "classes": "record"
    },
    {
        "id": 2,
        "name": "Bob",
        "isSelected": true,
        "classes": "selected record"
    },
    {
        "id": 3,
        "name": "Carla",
        "isSelected": true,
        "classes": "selected record"
    }
    ]
}