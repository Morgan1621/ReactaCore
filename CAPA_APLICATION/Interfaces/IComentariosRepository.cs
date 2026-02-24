using CAPA_DOMAIN;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CAPA_APLICATION.Interfaces
{
    public interface IComentariosRepository
    {
        Task<IEnumerable<Comentaios>> ListarComentaiosAsync();

        Task<IEnumerable<Comentaios>> ListarComentaiosPorNombreAsync();
        Task NuevoComentaiosAsync(Comentaios comentaios);
        Task EditarComentaiosAsync(Comentaios comentaios);

        Task EliminarComentaiosAsync(int Id);


    }
}
