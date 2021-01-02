const func = (param1 = 'param1', param2 = 'param2') => {
    console.log(param1, param2);
}

func();
func('Nagesh');
func('Nagesh', 'Siripurapu');
func('Nagesh', 'Siripurapu', 'USA');


func(['Nagesh', 'Siripurapu']);
func(['Nagesh', 'Siripurapu', 'USA']);


func(...['Nagesh', 'Siripurapu']);
func(...['Nagesh', 'Siripurapu', 'USA']);
