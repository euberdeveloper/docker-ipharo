const fs = require('fs');
const childProcess = require('child_process');

const text = childProcess.execSync('jupyter notebook --help-all').toString();
const template = fs.readFileSync('launch.template.sh', 'utf-8');

const shallowArgRegexp = /--(?<name>[a-zA-Z-]+)=\<(?<type>[a-zA-Z-]+)\>/g;
const shallowArgBoolRegexp = /--(?<name>[a-zA-Z-]+)[^=.a-zA-Z-]/g;
const approffonditoArgBoolRegexp = /--(?<scope>[a-zA-Z_]+)\.(?<name>[a-zA-Z_]+)=\<(?<type>[a-zA-Z_]+)\>/g;

const shallowValuesRaw = [...text.matchAll(shallowArgRegexp)];
const shallowBooleanValuesRaw = [...text.matchAll(shallowArgBoolRegexp)];
const approfonditiValuesRaw = [...text.matchAll(approffonditoArgBoolRegexp)];

const tuples = [...shallowValuesRaw, ...shallowBooleanValuesRaw, ...approfonditiValuesRaw]
    .filter(value => /[a-zA-Z]/g.test(value))
    .map(value => ({ scope: value.groups?.scope ?? 'None', name: value.groups?.name, type: value.groups?.type ?? 'Boolean' }))
    .map(({ scope, name, type }) => ({ scope, name: name.toUpperCase().replace(/-/g, '_'), type }));

const argumentsText = [
    '# Automatically generated with "generateLaunchSh.js"',
    ...new Set(tuples.map(({ scope, name, type }) => `"${name};${scope};${type}"`))
].join('\n\t');
const resultText = template.replace('{{ARGUMENTS}}', argumentsText);
fs.writeFileSync('launch.sh', resultText);