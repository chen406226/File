'use strict';

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports.create = exports.connect = undefined;

var _defineProperty2 = require('babel-runtime/helpers/defineProperty');

var _defineProperty3 = _interopRequireDefault(_defineProperty2);

var _getPrototypeOf = require('babel-runtime/core-js/object/get-prototype-of');

var _getPrototypeOf2 = _interopRequireDefault(_getPrototypeOf);

var _classCallCheck2 = require('babel-runtime/helpers/classCallCheck');

var _classCallCheck3 = _interopRequireDefault(_classCallCheck2);

var _createClass2 = require('babel-runtime/helpers/createClass');

var _createClass3 = _interopRequireDefault(_createClass2);

var _possibleConstructorReturn2 = require('babel-runtime/helpers/possibleConstructorReturn');

var _possibleConstructorReturn3 = _interopRequireDefault(_possibleConstructorReturn2);

var _inherits2 = require('babel-runtime/helpers/inherits');

var _inherits3 = _interopRequireDefault(_inherits2);

var _extends2 = require('babel-runtime/helpers/extends');

var _extends3 = _interopRequireDefault(_extends2);

var _react = require('react');

var _react2 = _interopRequireDefault(_react);

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

var Contexts = _react2.default.createContext();

var result;

function doaction(inward, change, s) {
  return function () {
    if (result === undefined) {
      result = inward.apply(undefined, [s].concat(Array.prototype.slice.call(arguments)));
    } else {
      result = inward.apply(undefined, [result].concat(Array.prototype.slice.call(arguments)));
    }
    change((0, _extends3.default)({}, result));
  };
}

function create(store, actions, Com) {

  return function (_Component) {
    (0, _inherits3.default)(App, _Component);

    function App(props) {
      (0, _classCallCheck3.default)(this, App);

      var _this = (0, _possibleConstructorReturn3.default)(this, (App.__proto__ || (0, _getPrototypeOf2.default)(App)).call(this, props));

      _this.doSet = function (m) {
        _this.setState(m);
      };

      _this.state = (0, _extends3.default)({}, store);
      return _this;
    }

    (0, _createClass3.default)(App, [{
      key: 'componentDidMount',
      value: function componentDidMount() {
        for (var key in actions) {
          var ac = actions[key].bind(this);
          this.setState((0, _defineProperty3.default)({}, key, doaction(ac, this.doSet, this.state)));
        }
      }
    }, {
      key: 'render',
      value: function render() {
        return _react2.default.createElement(
          Contexts.Provider,
          { value: this.state },
          _react2.default.createElement(Com, null)
        );
      }
    }]);
    return App;
  }(_react.Component);
}
function connect(Com) {
  var _class2, _temp;

  return _temp = _class2 = function (_Component2) {
    (0, _inherits3.default)(App, _Component2);

    function App() {
      (0, _classCallCheck3.default)(this, App);
      return (0, _possibleConstructorReturn3.default)(this, (App.__proto__ || (0, _getPrototypeOf2.default)(App)).apply(this, arguments));
    }

    (0, _createClass3.default)(App, [{
      key: 'render',
      value: function render() {
        var store = this.context;
        return _react2.default.createElement(Com, store);
      }
    }]);
    return App;
  }(_react.Component), _class2.contextType = Contexts, _temp;
}
exports.connect = connect;
exports.create = create;
// export default {
//   create,
//   connect
// }