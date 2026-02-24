using CAPA_DOMAIN;
using System;
using System.Collections.Generic;
using System.Data.SqlTypes;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CAPA_APLICATION.Interfaces
{
    public interface IEstadosRepository
    {

        Task<IEnumerable<ESTADO>> ListarEstadoAsync();

        Task<IEnumerable<ESTADO>> ListarEstadoPorNombreAsync();
        Task NuevoEstadoAsync(ESTADO sTADO);
        Task EditarEstadoAsync(ESTADO sTADO);

        Task EliminarEstadoAsync(int Id);

        /*pendiente ajaaa*/

    }
}
