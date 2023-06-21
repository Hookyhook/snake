async function test(){
let response = await fetch('snake.timkausemann.de/submit', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json;charset=utf-8'
    },
    body: JSON.stringify({
        username: 'test',
        score: 10
    })
  });
  
  let result = await response.json();
  alert(result);
}
test();