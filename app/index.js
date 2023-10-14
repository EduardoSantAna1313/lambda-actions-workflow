const html =  '<html>'
    + '<head><title>Gerar imagem</title></head>' 
    + '<body>'
    + '<h1>Generate image from prompt</h1>'
    + '<p>Prompt</p><input type="text"></input>'
    + '<button>OK</button>'
    + '</body>'
    + '</html>';

export const handler = function(event, context, callback) {
    var res ={
        "statusCode": 200,
        "headers": {
            "Content-Type": "text/html"
        }
    };
    
    res.body = html;
    callback(null, res);
};
