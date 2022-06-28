/*
 * @Description: 
 * @Version: 2.0
 * @Autor: mayako
 * @Date: 2022-06-24 12:00:24
 * @LastEditors: mayako
 * @LastEditTime: 2022-06-24 12:00:26
 */
module.exports = {
  //
  graphql: {
    config: {
      endpoint: '/graphql',
      shadowCRUD: true,
      playgroundAlways: false,
      depthLimit: 7,
      amountLimit: 100,
      apolloServer: {
        tracing: false,
      },
    },
  },
};