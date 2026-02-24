using CAPA_DOMAIN;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CAPA_APLICATION.Interfaces
{
    public interface IAsistentesRepository
    {

        Task<IEnumerable<Asistencia>> ListarAsistenciaAsync();

        Task<IEnumerable<Asistencia>> ListarAsistenciaPorNombreAsync();
        Task NuevoAsistenciaAsync(Asistencia asistencia);
        Task EditarAsistenciaAsync(Asistencia asistencia);

        Task EliminarAsistenciaAsync(int Id);







    }
}
