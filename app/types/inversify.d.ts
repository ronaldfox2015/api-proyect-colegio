export class Container {
    static merge(container1: any, container2: any): any;
    constructor(containerOptions: any);
    options: any;
    guid: any;
    parent: any;
    applyCustomMetadataReader(metadataReader: any): void;
    applyMiddleware(...args: any[]): void;
    bind(serviceIdentifier: any): any;
    createChild(): any;
    get(serviceIdentifier: any): any;
    getAll(serviceIdentifier: any): any;
    getAllNamed(serviceIdentifier: any, named: any): any;
    getAllTagged(serviceIdentifier: any, key: any, value: any): any;
    getNamed(serviceIdentifier: any, named: any): any;
    getTagged(serviceIdentifier: any, key: any, value: any): any;
    isBound(serviceIdentifier: any): any;
    isBoundNamed(serviceIdentifier: any, named: any): any;
    isBoundTagged(serviceIdentifier: any, key: any, value: any): any;
    load(...args: any[]): void;
    rebind(serviceIdentifier: any): any;
    resolve(constructorFunction: any): any;
    restore(): void;
    snapshot(): void;
    unbind(serviceIdentifier: any): void;
    unbindAll(): void;
    unload(...args: any[]): void;
}
export class ContainerModule {
    constructor(registry: any);
    guid: any;
    registry: any;
}
export class MetadataReader {
    getConstructorMetadata(constructorFunc: any): any;
    getPropertiesMetadata(constructorFunc: any): any;
}
export function decorate(decorator: any, target: any, parameterIndex: any): void;
export function getServiceIdentifierAsString(serviceIdentifier: any): any;
export function guid(): any;
export function inject(serviceIdentifier: any): any;
export function injectable(): any;
export function multiInject(serviceIdentifier: any): any;
export function named(name: any): any;
export function namedConstraint(value: any): any;
export function optional(): any;
export function postConstruct(): any;
export function tagged(metadataKey: any, metadataValue: any): any;
export function taggedConstraint(key: any): any;
export function targetName(name: any): any;
export function traverseAncerstors(request: any, constraint: any): any;
export function typeConstraint(type: any): any;
export function unmanaged(): any;
